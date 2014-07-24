<%@ page import="java.io.InputStream,java.io.IOException,javax.xml.parsers.SAXParser,javax.xml.parsers.SAXParserFactory"
  session="false" %>
<%@ page contentType="text/html;charset=utf8" %>
<body bgcolor="#ffffff" onLoad="whatBrowser()">
<SCRIPT>
	<!-- Begin
	function whatBrowser() {
	document.Browser.Name.value=navigator.appName;
	document.Browser.Version.value=navigator.appVersion;
	//document.Browser.Code.value=navigator.appCodeName;
	document.Browser.Agent.value=navigator.userAgent;
	}
	// End -->
</SCRIPT>
<TABLE border="0" cellspacing="0" cellpadding="0">
<FORM NAME="Browser" >
	<TR>
	<TD> 您使用的浏览器: </TD>
	<TD> <INPUT TYPE="txt" NAME="Name" Size="45"></TD>
	</TR>
	<TR>
	<TD> 浏览器版本: </TD>
	<TD> <INPUT TYPE="txt" NAME="Version" Size="45"></TD>
	</TR>
	<TR>
	<TR>
	<TD> User-Agent: </TD>
	<TD> <INPUT TYPE="txt" NAME="Agent" Size="45"></TD>
	</TR>
</FORM>
</TABLE>
 
<!-- 
<p><b><font  color="#800000">1.SUP类加载路径</font></b><br>
<br>
<font size="2">
<%
    wantClass(out,"com.sunrise.sup.core.Version", "sup的jar包","SUP API","操作封装层","咨询sup开发人员");        
%>
</font>
<br>
 -->
<br><br>
<b><font color="#800000">jar路径</font></b><br>
<font color="#0000FF" size="2">
<%
 out.write(System.getProperty("java.class.path")+"\n");
%>
</font>

<br><br>
<b><font color="#800000">系统运行环境</font></b><br>
<%
    java.util.Enumeration e=null;
    try {
        e= System.getProperties().propertyNames();
    } catch (SecurityException se) {
    }
    if(e!=null) {
        out.write("<pre>");
        for (;e.hasMoreElements();) {
            String key = (String) e.nextElement();
            out.write(key + "=" + System.getProperty(key)+"\n");
        }
        out.write("</pre><p>");
    } else {
        out.write("System properties are not accessible<p>");
    }
%>



  <%!
    Class classExists(String classname) {
        try {
            return Class.forName(classname);
        } catch (ClassNotFoundException e) {
            return null;
        }
    }

    /**
     * 通过一个类的路径参数确定是否有这个类，返回一个真假值

     */
    boolean resourceExists(String resource) {
        boolean found;
        InputStream instream=this.getClass().getResourceAsStream(resource);
        found=instream!=null;
        if(instream!=null) {
            try {
                instream.close();
            } catch (IOException e) {
            }
        }
        return found;
    }

    /**
     * probe for a class, print an error message is missing
      根据不同的类路径提示警告、错误
     * @param out stream to print stuff
     * @param category text like "warning" or "error"
     * @param classname class to look for
     * @param jarFile where this class comes from
     * @param errorText extra error text
     * @param homePage where to d/l the library
     * @return the number of missing classes
     * @throws IOException
     */
    int probeClass(JspWriter out,
                   String category,
                   String classname,
                   String jarFile,
                   String description,
                   String errorText,
                   String homePage) throws IOException {
        try {
            Class clazz = classExists(classname);
            if(clazz == null)  {
               String url="";
               if(homePage!=null) {
                  url="<br>查看帮助连接<a href="+homePage+">"+homePage+"</a>";
               }
               out.write("<p>"+category+"找不到class :"+classname
                   +" from file <b>"+jarFile
                   +"</b><br>  "+errorText
                   +url
                   +"<p>");
               return 1;
            } else {
               String location = getLocation(out, clazz);
               if(location == null) {
                  out.write( description + " (" + classname + ")<br>");
               }
               else {
                  out.write( description + " (" + classname + ") 类加载路径<br> " + location + "<br>");
               }
               return 0;
            }
        } catch(NoClassDefFoundError ncdfe) { 
            String url="";
            if(homePage!=null) {
                url="<br>  See <a href="+homePage+">"+homePage+"</a>";
            }
            out.write("<p>"+category+": could not find a dependency"
                    +" of class "+classname
                    +" from file <b>"+jarFile
                    +"</b><br> "+errorText
                    +url
                    +"<br>The root cause was: "+ncdfe.getMessage()
                    +"<br>This can happen e.g. if "+classname+" is in" 
                    +" the 'common' classpath, but a dependency like "
                    +" activation.jar is only in the webapp classpath."
                    +"<p>");
            return 1;
        }
    }

    /**
      得到一个类的位置，当一个类找到了
     * get the location of a class
     * @param out
     * @param clazz
     * @return the jar file or path where a class was found
     */

    String getLocation(JspWriter out,
                       Class clazz) {
        try {
            java.net.URL url = clazz.getProtectionDomain().getCodeSource().getLocation();
            String location = url.toString();
            if(location.startsWith("jar")) {
                url = ((java.net.JarURLConnection)url.openConnection()).getJarFileURL();
                location = url.toString();
            } 
            
            if(location.startsWith("file")) {
                java.io.File file = new java.io.File(url.getFile());
                return file.getAbsolutePath();
            } else {
                return url.toString();
            }
        } catch (Throwable t){
        }
        return "an unknown location";
    }

    /**
     * a class we need if a class is missing
     * @param out stream to print stuff
     * @param classname class to look for
     * @param jarFile where this class comes from
     * @param errorText extra error text
     * @param homePage where to d/l the library
     * @throws IOException when needed
     * @return the number of missing libraries (0 or 1)
     */
    int needClass(JspWriter out,
                   String classname,
                   String jarFile,
                   String description,
                   String errorText,
                   String homePage) throws IOException {
        return probeClass(out,
                "<b>Error</b>",
                classname,
                jarFile,
                description,
                errorText,
                homePage);
    }

    /**
     * print warning message if a class is missing
       打印出警告信息,如果缺少一个类
     * @param out stream to print stuff
     * @param classname class to look for
     * @param jarFile where this class comes from
     * @param errorText extra error text
     * @param homePage where to d/l the library
     * @throws IOException when needed
     * @return the number of missing libraries (0 or 1)
     */
    int wantClass(JspWriter out,
                   String classname,
                   String jarFile,
                   String description,
                   String errorText,
                   String homePage) throws IOException {
        return probeClass(out,
                "<b>错误:</b>",
                classname,
                jarFile,
                description,
                errorText,
                homePage);
    }

  


    /**
     *  get servlet version string
     *
     */

    public String getServletVersion() {
       getpara();
      //  ServletContext context=
        int major = context.getMajorVersion();
        int minor = context.getMinorVersion();
        return Integer.toString(major) + '.' + Integer.toString(minor);
    }



    /**
     * what parser are we using.
     * @return the classname of the parser
     */
    private String getParserName() {
        SAXParser saxParser = getSAXParser();
        if (saxParser == null) {
            return "Could not create an XML Parser";
        }

        // check to what is in the classname
        String saxParserName = saxParser.getClass().getName();
        return saxParserName;
    }

    /**
     * Create a JAXP SAXParser
     * @return parser or null for trouble
     */
    private SAXParser getSAXParser() {
        SAXParserFactory saxParserFactory = SAXParserFactory.newInstance();
        if (saxParserFactory == null) {
            return null;
        }
        SAXParser saxParser = null;
        try {
            saxParser = saxParserFactory.newSAXParser();
        } catch (Exception e) {
        }
        return saxParser;
    }

    /**
     * get the location of the parser
     * @return path or null for trouble in tracking it down
     */

    private String getParserLocation(JspWriter out) {
        SAXParser saxParser = getSAXParser();
        if (saxParser == null) {
            return null;
        }
        String location = getLocation(out,saxParser.getClass());
        return location;
    }
   %>
   </body> 