using System;
using System.ComponentModel;
namespace exam.Model.Status
{


	public enum Uloga
	{
		Admin =1,
		Uposlenik,
		Korisnik
	}

	public enum StatusAktivnosti
	{

		U_Toku,
        Realizovana,
        Istekla

	}

    public enum VrijednostRaspolozenja
    {

        Sretan,
        Tuzan,
        Uzbudjen,
		Umoran,
		Pod_Stresom

    }

	public enum StatusRezervacije
	{ 
		Potvrdjena,
		Na_cekanju,
		Otkazana
	}
}

