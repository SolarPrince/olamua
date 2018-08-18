<?php namespace Dunglh\Shop\Classes;

class Helper{
    public static function vnNumberFormat($number, $decimal = 0){
        return number_format($number, $decimal, ',', '.');
    }
}