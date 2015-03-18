######################################################################
# cdn.inc.pl - This is PyukiWiki yet another Wiki clone
# $Id: cdn.inc.pl,v 1.16 2013/06/09 02:03:53 papu Exp $
# Build 2013-06-09 11:02:30
#
# "PyukiWiki" ver 0.2.1-beta9 $$
# Author Nanami http://nanakochi.daiba.cx/
# Copyright(C) 2004-2007 Nekyo
# Copyright(C) 2005-2013 PyukiWiki Developers Team
# http://pyukiwiki.info/
# Based on YukiWiki http://www.hyuki.com/yukiwiki/
# Powerd by PukiWiki http://pukiwiki.sfjp.jp/
# License GPL3 and/or Artistic or each later version
#
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.
# Return=CRLF Code=EUC-JP 1TAB=4Spaces
######################################################################
# This is extented plugin.
# To use this plugin, rename to 'cdn.inc.cgi'

$cdn::usepyukiwikicdn=1
	if(!defined($cdn::usepyukiwikicdn));

$cdn::usepubliccdn=1
	if(!defined($cdn::usepubliccdn));

# PyukiWiki専用のCDNの設定
$cdn::baseurls=<<EOM if($cdn::baseurls ne "");
http://cdn.pyukiwiki.info
http://cdn.daiba.cx
http://pcdn.info
EOM

$base="http://cdn.daiba.cx"; #test

# パプリックCDNの設定
# google, cdnjs
$cdn::publiccdnlist=<<EOM;
google
microsoft
EOM

# CDN対象のバージョン
$cdn::version{jquery1}="1.9.1"
	if($cdn::version{jquery1} eq "");

$cdn::version{jquery2}="2.0.2"
	if($cdn::version{jquery2} eq "");

$cdn::version{jquery-migrate}="1.2.1"
	if($cdn::version{jquery-migrate} eq "");

$cdn::version{jqModal}="r14"
	if($cdn::version{jqModal} eq "");

$cdn::version{swfobject}="2.2"
	if($cdn::version{swfobject} eq "");

$cdn::version{tdiary}="3.2.2"
	if($cdn::version{tdiary} eq "");

$cdn::version{SyntaxHighllighter}="3.0.83"
	if($cdn::version{SyntaxHighllighter} eq "");

$cdn::version{mediaelement}="2.11.3"
	if($cdn::version{mediaelement} eq "");

######################################################################

$cdn::base{release}="$base/PyukiWiki/release";
$cdn::base{plugin}="$base/PyukiWiki/plugins";
$cdn::theme{tdiary}="$base/tdiary/theme/tdiary-theme-";

######################################################################

# jquery
$cdn::baseurl{jquery1}="/libs/jquery/\$version/jquery.min.js";
$cdn::baseurl{jquery2}="/libs/jquery/\$version/jquery.min.js";
$cdn::baseurl{jquery-migrate}="/libs/jquery-migrate/\$version/jquery-migrate.min.js";
$cdn::baseurl{jqModal}="/libs/jqModal/\$version/jqModal.js";

# swfobject
$cdn::baseurl{swfobject}="/libs/swfobject/\$version/swfobject.js";

# SyntaxHighlighter
$cdn::baseurl{SyntaxHighllighter}="/libs/SyntaxHighlighter/\$version/scripts/shCore.js";

# mediaelement
$cdn::baseurl{mediaelement}="/libs/mediaelement/\$version/js/mediaelement.min.js";

######################################################################

# google api
# https://developers.google.com/speed/libraries/devguide?hl=ja
$cdn::url{google}="//ajax.googleapis.com/ajax";
$cdn::target{google}="jquery1,jquery2,jquery-migrate,swfobject";

# cdnjs
# http://cdnjs.com/
$cdn::url{cdnjs}="//cdnjs.cloudflare.com/ajax";
$cdn::target{cdnjs}="jquery1,jquery2,jquery-migrate,jqModal,swfobject";

@cdn::cdnfiles=(
	"jquery/",
	"audio/",
	"syntaxhighlighter/",
	"ad.css", "blosxom.css", "image.css", "instag.css", "login.css",
	"logs_viewer.css", "pyukiwiki.default.css", "pyukiwiki.print.css",
	"pyukiwikigreen.default.css", "pyukiwikigreen.print.css",
	"smedia.css", "tdiary.default.css", "tdiary.print.css",
	"img-exedit.css", "img-icon.css", "img.css",
	"img-lang.css", "img-login.css",
	"bookmark.js", "captcha.js", "common.en.js", "common.unicode.ja.js",
	"debugscript.js", "edit.js", "instag.js", "loader.js", "location.js",
	"login.js", "passwd.js", "setting.js", "smedia.js", "twitter.js",
);

sub plugin_cdn_init {
	if($cdn::usepyukiwikicdn) {
		my $baseversion=$::version;
		$baseversion=~s/\-utf8//g;
		$baseversion=~s/\-xs//g;
		my $ver=$::version;
		$ver=~s/\-xs//g;

#		$::image_url="$cdn::base{release}/$baseversion/pyukiwiki-$ver/image";
#		$::skin_url="$cdn::base{release}/$baseversion/pyukiwiki-$ver/skin";
		$::skin_tdiary_url="$cdn::theme{tdiary}$cdn::version{tdiary}";
	}

	if($cdn::usepubliccdn) {
	}

	return('init'=>1);
}


1;
__DATA__
sub plugin_antispamwiki_setup {
	return(
		ja'=>'PyukiWiki コンテンツデリバリー'',
		en=>'PyukiWiki CDN',
		override=>'',
		require=>'',
		url=>'http://pyukiwiki.info/PyukiWiki/Plugin/ExPlugin/cdn/'
	);
}
__END__

=head1 NAME

cdn.inc.pl - PyukiWiki Plugin

=head1 SYNOPSIS

Using PyukiWiki CDN

=head1 DESCRIPTION

Display fastest wiki of using PyukiWiki CDN

=head1 USAGE

rename to cdn.inc.cgi

=head1 OVERRIDE

none

=head1 SEE ALSO

=over 4

=item PyukiWiki/Plugin/ExPlugin/cdn

L<http://pyukiwiki.info/PyukiWiki/Plugin/ExPlugin/antispam/>

=item PyukiWiki CVS

L<http://sfjp.jp/cvs/view/pyukiwiki/PyukiWiki-Devel/lib/cdn.inc.pl?view=log>

L<http://sfjp.jp/cvs/view/pyukiwiki/PyukiWiki-Devel-UTF8/lib/cdn.inc.pl?view=log>

L<http://cvs.pyukiwiki.info/cgi-bin/cvsweb.cgi/PyukiWiki-Devel/lib/cdn.inc.pl?view=log>

L<http://cvs.pyukiwiki.info/cgi-bin/cvsweb.cgi/PyukiWiki-Devel-UTF8/lib/cdn.inc.pl?view=log>

=back

=head1 AUTHOR

=over 4

=item Nanami

L<http://nanakochi.daiba.cx/> etc...

=item PyukiWiki Developers Team

L<http://pyukiwiki.info/>

=back

=head1 LICENSE

Copyright(C) 2005-2013 by Nanami.

Copyright(C) 2005-2013 by PyukiWiki Developers Team

License is GNU GENERAL PUBLIC LICENSE 3 and/or Artistic 1 or each later version.

This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut
