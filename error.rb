#!/usr/local/bin/ruby
print "Content-type: text/html\n\n"
print <<EOM
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=euc-jp">
</head>
<body>
<h1>Rubyでフォームのデータを受け取る</h1>
<form action="00.cgi" method="post">
	<input type="text" name="textdata" value="">
	<input type="submit" value="入力文字を表示">
</form>
</body>
</html>
EOM

