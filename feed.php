<?php

$data = [];
$xml = simplexml_load_file('https://us7.campaign-archive.com/feed?u=3749c15a8759f402eb64ab3d0&id=4e67495a84');

$data = $xml->xpath("//item");

foreach ($data as $key => $element) {
    $unix = strtotime($element->pubDate);
    $date = (new DateTime())->setTimestamp($unix);

    $html = str_replace('<!doctype html>', '', $element->description);

    $myfile = fopen('_newsletters/' . $key + 1 . '.md', 'wb') or die('Unable to create file!');
    $txt = "---
layout: newsletters
title:  " . $element->title . "
date: " . $date->format('Y-m-d H:i:s') . "
number: " . $key + 1 . "
---
" . $html . "
";

    fwrite($myfile, $txt);
    fclose($myfile);
}
