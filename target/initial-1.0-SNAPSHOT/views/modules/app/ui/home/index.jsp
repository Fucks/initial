<%-- 
    Document   : index
    Created on : 06/11/2015, 10:26:14
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <jsp:include page="../../styles.jsp" />
        <link rel="stylesheet" href="<c:url value="/resource/css/custom/custom.css" />">
        <c:url value="/logout" var="logoutUrl" />
    </head>
    <body>
        <!-- Navigation Bar-->
        <header id="topnav">
            <div class="topbar-main">
                <div class="container">

                    <!-- Logo container-->
                    <div class="logo">
                        <a href="http://coderthemes.com/ubold_1.4/menu_2/index.html" class="logo"><span>Ub<i class="md md-album"></i>ld</span></a>
                    </div>
                    <!-- End Logo container-->

                    <div class="menu-extras">

                        <ul class="nav navbar-nav navbar-right pull-right">
                            <li>
                                <form role="search" class="navbar-left app-search pull-left hidden-xs">
                                    <input type="text" placeholder="Search..." class="form-control">
                                    <a href=""><i class="fa fa-search"></i></a>
                                </form>
                            </li>
                            <li class="dropdown hidden-xs">
                                <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#" data-target="#" class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="true">
                                    <i class="icon-bell"></i> <span class="badge badge-xs badge-danger">3</span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-lg">
                                    <li class="notifi-title"><span class="label label-default pull-right">New 3</span>Notification</li>
                                    <li class="list-group nicescroll notification-list" style="overflow: hidden; outline: none;" tabindex="5000">
                                        <!-- list item-->
                                        <a href="javascript:void(0);" class="list-group-item">
                                            <div class="media">
                                                <div class="pull-left p-r-10">
                                                    <em class="fa fa-diamond fa-2x text-primary"></em>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">A new order has been placed A new order has been placed</h5>
                                                    <p class="m-0">
                                                        <small>There are new settings available</small>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>

                                        <!-- list item-->
                                        <a href="javascript:void(0);" class="list-group-item">
                                            <div class="media">
                                                <div class="pull-left p-r-10">
                                                    <em class="fa fa-cog fa-2x text-custom"></em>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">New settings</h5>
                                                    <p class="m-0">
                                                        <small>There are new settings available</small>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>

                                        <!-- list item-->
                                        <a href="javascript:void(0);" class="list-group-item">
                                            <div class="media">
                                                <div class="pull-left p-r-10">
                                                    <em class="fa fa-bell-o fa-2x text-danger"></em>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">Updates</h5>
                                                    <p class="m-0">
                                                        <small>There are <span class="text-primary font-600">2</span> new updates available</small>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>

                                        <!-- list item-->
                                        <a href="javascript:void(0);" class="list-group-item">
                                            <div class="media">
                                                <div class="pull-left p-r-10">
                                                    <em class="fa fa-user-plus fa-2x text-info"></em>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">New user registered</h5>
                                                    <p class="m-0">
                                                        <small>You have 10 unread messages</small>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>

                                        <!-- list item-->
                                        <a href="javascript:void(0);" class="list-group-item">
                                            <div class="media">
                                                <div class="pull-left p-r-10">
                                                    <em class="fa fa-diamond fa-2x text-primary"></em>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">A new order has been placed A new order has been placed</h5>
                                                    <p class="m-0">
                                                        <small>There are new settings available</small>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>

                                        <!-- list item-->
                                        <a href="javascript:void(0);" class="list-group-item">
                                            <div class="media">
                                                <div class="pull-left p-r-10">
                                                    <em class="fa fa-cog fa-2x text-custom"></em>
                                                </div>
                                                <div class="media-body">
                                                    <h5 class="media-heading">New settings</h5>
                                                    <p class="m-0">
                                                        <small>There are new settings available</small>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="list-group-item text-right">
                                            <small class="font-600">See all notifications</small>
                                        </a>
                                    </li>
                                    <div id="ascrail2000" class="nicescroll-rails" style="width: 8px; z-index: 1000; cursor: default; position: absolute; top: 0px; left: -8px; height: 0px; display: none;"><div style="position: relative; top: 0px; float: right; width: 6px; height: 0px; border: 1px solid rgb(255, 255, 255); border-radius: 5px; background-color: rgb(152, 166, 173); background-clip: padding-box;"></div></div><div id="ascrail2000-hr" class="nicescroll-rails" style="height: 8px; z-index: 1000; top: -8px; left: 0px; position: absolute; cursor: default; display: none;"><div style="position: relative; top: 0px; height: 6px; width: 0px; border: 1px solid rgb(255, 255, 255); border-radius: 5px; background-color: rgb(152, 166, 173); background-clip: padding-box;"></div></div></ul>
                            </li>

                            <li class="dropdown">
                                <a href="" class="dropdown-toggle waves-effect waves-light profile" data-toggle="dropdown" aria-expanded="true"><img src="./Ubold - Responsive Admin Dashboard Template_files/avatar-1.jpg" alt="user-img" class="img-circle"> </a>
                                <ul class="dropdown-menu">
                                    <li><a href="javascript:void(0)"><i class="ti-user m-r-5"></i> Profile</a></li>
                                    <li><a href="javascript:void(0)"><i class="ti-settings m-r-5"></i> Settings</a></li>
                                    <li><a href="javascript:void(0)"><i class="ti-lock m-r-5"></i> Lock screen</a></li>
                                    <li><a href="javascript:void(0)"><i class="ti-power-off m-r-5"></i> Logout</a></li>
                                </ul>
                            </li>
                        </ul>

                        <div class="menu-item">
                            <!-- Mobile menu toggle-->
                            <a class="navbar-toggle">
                                <div class="lines">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div>
                            </a>
                            <!-- End mobile menu toggle-->
                        </div>
                    </div>

                </div>
            </div>
            <!-- End topbar -->


            <!-- Navbar Start -->
            <div class="navbar-custom">
                <div class="container">
                    <div id="navigation">
                        <!-- Navigation Menu-->
                        <ul class="navigation-menu">
                            <li class="has-submenu active">
                                <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#"><i class="md md-dashboard"></i>Dashboard</a>
                                <ul class="submenu">
                                    <li>
                                        <a href="http://coderthemes.com/ubold_1.4/menu_2/index.html">Dashboard 01</a>
                                    </li>
                                    <li>
                                        <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_2.html">Dashboard 02</a>
                                    </li>
                                    <li class="active">
                                        <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html">Dashboard 03</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#"><i class="md md-color-lens"></i>UI Kit</a>
                                <ul class="submenu">
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ui-buttons.html">Buttons</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ui-panels.html">Panels</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ui-portlets.html">Portlets</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ui-checkbox-radio.html">Checkboxs-Radios</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ui-tabs.html">Tabs</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ui-modals.html">Modals</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ui-progressbars.html">Progress Bars</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ui-notification.html">Notification</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ui-images.html">Images</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ui-carousel.html">Carousel</a>
                                    </li><li><a href="http://coderthemes.com/ubold_1.4/menu_2/ui-bootstrap.html">Bootstrap UI</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ui-typography.html">Typography</a></li>
                                </ul>
                            </li>


                            <li class="has-submenu">
                                <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#"><i class="md md-layers"></i>Components</a>
                                <ul class="submenu megamenu">
                                    <li>
                                        <ul>
                                            <li>
                                                <span>Elements</span>
                                            </li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/components-grid.html">Grid</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/components-widgets.html">Widgets</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/components-nestable-list.html">Nesteble</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/components-range-sliders.html">Range sliders</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/components-animation.html">Animation</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/components-sweet-alert.html">Sweet Alerts</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <ul>
                                            <li>
                                                <span>Forms</span>
                                            </li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/form-elements.html">General Elements</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/form-advanced.html">Advanced Form</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/form-validation.html">Form Validation</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/form-pickers.html">Form Pickers</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/form-wizard.html">Form Wizard</a></li>

                                        </ul>
                                    </li>

                                    <li>
                                        <ul>
                                            <li>
                                                <span>Forms</span>
                                            </li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/form-mask.html">Form Masks</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/form-summernote.html">Summernote</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/form-wysiwig.html">Wysiwig Editors</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/form-uploads.html">Multiple File Upload</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/form-xeditable.html">X-editable</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/form-image-crop.html">Image Crop</a></li>
                                        </ul>
                                    </li>


                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#"><i class="md md-class"></i>Other</a>
                                <ul class="submenu">
                                    <li class="has-submenu">
                                        <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#">Tables</a>
                                        <ul class="submenu">
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/tables-basic.html">Basic Tables</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/tables-datatable.html">Data Table</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/tables-editable.html">Editable Table</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/tables-responsive.html">Responsive Table</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/tables-foo-tables.html">FooTable</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/tables-bootstrap.html">Bootstrap Tables</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/tables-tablesaw.html">Tablesaw</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu">
                                        <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#">Charts</a>
                                        <ul class="submenu">
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/chart-flot.html">Flot Chart</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/chart-morris.html">Morris Chart</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/chart-chartjs.html">Chartjs</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/chart-peity.html">Peity Charts</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/chart-chartist.html">Chartist Charts</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/chart-c3.html">C3 Charts</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/chart-nvd3.html"> Nvd3 Charts</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/chart-sparkline.html">Sparkline charts</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/chart-radial.html">Radial charts</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/chart-other.html">Other Chart</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/chart-ricksaw.html">Ricksaw Chart</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu">
                                        <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#">Icons</a>
                                        <ul class="submenu">
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/icons-glyphicons.html">Glyphicons</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/icons-materialdesign.html">Material Design</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/icons-ionicons.html">Ion Icons</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/icons-fontawesome.html">Font awesome</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/icons-themifyicon.html">Themify Icons</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/icons-simple-line.html">Simple line Icons</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/icons-weather.html">Weather Icons</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/icons-typicons.html">Typicons</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-submenu">
                                        <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#">Maps</a>
                                        <ul class="submenu">
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/map-google.html"> Google Map</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/map-vector.html"> Vector Map</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>

                            <li class="has-submenu">
                                <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#"><i class="md md-pages"></i>Pages</a>
                                <ul class="submenu megamenu">
                                    <li>
                                        <ul>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-starter.html">Starter Page</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-login.html">Login</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-login-v2.html">Login v2</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-register.html">Register</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-register-v2.html">Register v2</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-signup-signin.html">Signin - Signup</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-recoverpw.html">Recover Password</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <ul>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-lock-screen.html">Lock Screen</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-400.html">Error 400</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-403.html">Error 403</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-404.html">Error 404</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-404_alt.html">Error 404-alt</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-500.html">Error 500</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/page-503.html">Error 503</a></li>
                                        </ul>
                                    </li>

                                </ul>
                            </li>


                            <li class="has-submenu">
                                <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#"><i class="md md-folder-special"></i>Extras</a>
                                <ul class="submenu megamenu">
                                    <li>
                                        <ul>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/extra-profile.html">Profile</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/extra-timeline.html">Timeline</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/extra-sitemap.html">Site map</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/extra-invoice.html">Invoice</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/extra-email-template.html">Email template</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/extra-maintenance.html">Maintenance</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/extra-coming-soon.html">Coming-soon</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <ul>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/extra-faq.html">FAQ</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/extra-search-result.html">Search result</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/extra-gallery.html">Gallery</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/extra-pricing.html">Pricing</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/apps-inbox.html"> Email</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/apps-calendar.html"> Calendar</a></li>
                                            <li><a href="http://coderthemes.com/ubold_1.4/menu_2/apps-contact.html"> Contact</a></li>
                                        </ul>
                                    </li>


                                </ul>
                            </li>

                            <li class="has-submenu">
                                <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#"><i class="md md-account-circle"></i>CRM</a>
                                <ul class="submenu">
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/crm-dashboard.html"> Dashboard </a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/crm-contact.html"> Contacts </a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/crm-opportunities.html"> Opportunities </a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/crm-leads.html"> Leads </a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/crm-customers.html"> Customers </a></li>
                                </ul>
                            </li>
                            <li class="has-submenu last-elements">
                                <a href="http://coderthemes.com/ubold_1.4/menu_2/dashboard_3.html#"><i class="md md-shopping-cart"></i>eCommerce</a>
                                <ul class="submenu">
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ecommerce-dashboard.html"> Dashboard</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ecommerce-products.html"> Products</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ecommerce-product-detail.html"> Product Detail</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ecommerce-orders.html"> Orders</a></li>
                                    <li><a href="http://coderthemes.com/ubold_1.4/menu_2/ecommerce-sellers.html"> Sellers</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- End navigation menu        -->
                    </div>
                </div>
            </div>
        </header>
        <!-- End Navigation Bar-->


        <div ui-view ></div>

        <jsp:include page="../../scripts.jsp" />

        <!-- Controllers do modulo -->
        <script type="text/javascript" src="<c:url value="/views/modules/app/home-main.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/app/controller/home-controller.js" />" ></script>
    </body>
</html>
