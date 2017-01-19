<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<#if RequestParameters['error']??>
<div class="alert alert-danger">
    There was a problem logging in. Please try again.
</div>
</#if>
<div class="row">
    <div class="col-md-4"></div>
    <div class="col-xs-12 col-md-4">
        <div class="jumbotron login-jumbotron">
            <div class="container">
                <center><h2 class="jumbotron-title">LOGIN</h2></center>
                <br>
                <br>
                <form action="login" method="post" role="form">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="Username" name="username" type="text"
                                   autofocus="autofocus">
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Password" name="password" type="password" value="">
                        </div>
                        <input type="hidden" id="csrf_token" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input class="btn btn-lg btn-greeny btn-block" type="submit" value="Login">
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-4"></div>
</div>
</div>
</body>
</html>