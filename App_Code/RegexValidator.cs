using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// Summary description for RegexValidator
/// </summary>
public static class RegexValidation
{
    public static bool IsEmailValid(string inputEmail)
    {
        //Regex To validate Email Address
        Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
        Match match = regex.Match(inputEmail);
        if (match.Success)
            return true;

        else

            return false;
    }

    public static bool IsNameValid(string inputName)
    {
        //Regex To validate Name 
        //1-40 lang 
        Regex regex = new Regex(@"^[ÆØÅæøåa-zA-Z''-'\s]{1,40}$");
        Match match = regex.Match(inputName);
        if (match.Success)
            return true;

        else

            return false;
    }

    public static bool IsPostnrValid(string inputPostnr)
    {
        // Regex til at validere en post nr
        Regex regex = new Regex(@"^[0-9]{4}$");
        Match match = regex.Match(inputPostnr);
        if (match.Success)
            return true;
        else
            return false;
    }

    public static bool IsTlfNrValid(string inputTlfNr)
    {
        // Regex til at validere en tlf nr 8 lang
        Regex regex = new Regex(@"^[0-9]{8}$");
        Match match = regex.Match(inputTlfNr);
        if (match.Success)
            return true;
        else
            return false;
    }
}