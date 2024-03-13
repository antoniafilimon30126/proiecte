using System;

/*
class ex1
{
    static void Main()
    {
        Console.WriteLine("Introduceți numărul de termeni pentru secvența Fibonacci:");
        int n = Convert.ToInt32(Console.ReadLine());

        Console.WriteLine("Primii " + n + " termeni ai secvenței Fibonacci sunt:");

        for (int i = 0; i < n; i++)
        {
            Console.Write(Fibonacci(i) + " ");
        }
    }

    static int Fibonacci(int n)
    {
        if (n <= 1)
        {
            return n;
        }
        else
        {
            int F0 = 0, F1 = 1, Fn = 0;
            for (int i = 2; i <= n; i++)
            {
                Fn = F0 + F1;
                F0 = F1;
                F1 = Fn;
            }
            return Fn;
        }
    }
}

*/

/* ex2

using System;

class Calculator
{
    private double a;
    private double b;

    public Calculator(double a, double b)
    {
        this.a = a;
        this.b = b;
    }

    public double Adunare()
    {
        return a + b;
    }

    public double Scadere()
    {
        return a - b;
    }

    public double Inmultire()
    {
        return a * b;
    }

    public double Impartire()
    {
        if (b != 0)
            return a / b;
        else
            throw new DivideByZeroException("Nu se poate realiza impartirea");
    }

    public void Afisare()
    {
        Console.WriteLine($"Rezultatele operațiilor: ");
        Console.WriteLine($"Adunare: {Adunare()}");
        Console.WriteLine($"Scădere: {Scadere()}");
        Console.WriteLine($"Înmulțire: {Inmultire()}");
        try
        {
            Console.WriteLine($"Împărțire: {Impartire()}");
        }
        catch (DivideByZeroException e)
        {
            Console.WriteLine(e.Message);
        }
    }
}

class ex2
{
    static void Main()
    {
        Console.WriteLine("Introduceți primul număr:");
        double a = Convert.ToDouble(Console.ReadLine());

        Console.WriteLine("Introduceți al doilea număr:");
        double b = Convert.ToDouble(Console.ReadLine());

        Calculator calc = new Calculator(a, b);
        calc.Afisare();
    }
}
*/

/*
class ex3
{
    static void Main()
    {
        Console.WriteLine("Selectați conversia dorită:");
        Console.WriteLine("1. Convertire din Celsius în Fahrenheit");
        Console.WriteLine("2. Convertire din Fahrenheit în Celsius");

        int optiune = Convert.ToInt32(Console.ReadLine());

        Func<double, double> conversie = null;
        string unitateOrigine = "";
        string unitateDestinatie = "";

        switch (optiune)
        {
            case 1:
                conversie = temperatura => (temperatura * 9 / 5) + 32;
                unitateOrigine = "Celsius";
                unitateDestinatie = "Fahrenheit";
                break;
            case 2:
                conversie = temperatura => (temperatura - 32) * 5 / 9;
                unitateOrigine = "Fahrenheit";
                unitateDestinatie = "Celsius";
                break;
            default:
                Console.WriteLine("Opțiune invalidă.");
                return;
        }

        Console.WriteLine($"Introduceți temperatura în grade {unitateOrigine}:");
        double temperaturaInput = Convert.ToDouble(Console.ReadLine());

        double temperaturaConvertita = conversie(temperaturaInput);
        Console.WriteLine($"{temperaturaInput} °{unitateOrigine} = {temperaturaConvertita} °{unitateDestinatie}");
    }
}

*/

/*
using System;

class GreutateIdealaCalculator
{
    public double CalculGreutateBarbat(int inaltime, int varsta)
    {
        return inaltime - 100 - ((inaltime - 150) / 4.0) + ((varsta - 20) / 4.0);
    }

    public double CalculGreutateFemeie(int inaltime, int varsta)
    {
        return inaltime - 100 - ((inaltime - 150) / 2.5) + ((varsta - 20) / 6.0);
    }

    public void AfisareGreutate(double greutate, char sex)
    {
        string sexString = (sex == 'm') ? "barbat" : "femeie";
        Console.WriteLine($"Greutatea ideala pentru un {sexString} este: {greutate} kg");
    }
}

class ex4
{
    static void Main(string[] args)
    {
        GreutateIdealaCalculator calculator = new GreutateIdealaCalculator();

        Console.WriteLine("Introduceti inaltimea (cm):");
        int inaltime = Convert.ToInt32(Console.ReadLine());

        Console.WriteLine("Introduceti varsta (ani):");
        int varsta = Convert.ToInt32(Console.ReadLine());

        Console.WriteLine("Introduceti sexul (m sau f):");
        char sex = Convert.ToChar(Console.ReadLine());

        double greutate;
        if (sex == 'm')
        {
            greutate = calculator.CalculGreutateBarbat(inaltime, varsta);
        }
        else if (sex == 'f')
        {
            greutate = calculator.CalculGreutateFemeie(inaltime, varsta);
        }
        else
        {
            Console.WriteLine("Sexul introdus nu este valid.");
            return;
        }

        calculator.AfisareGreutate(greutate, sex);
    }
}
*/

using System;

class ex5
{
    static void Main(string[] args)
    {
        Console.WriteLine("Introduceti numerele intregi separate prin spatiu:");
        string input = Console.ReadLine();

        string[] numereString = input.Split(' ');
        int[] numereIntregi = new int[numereString.Length];

        for (int i = 0; i < numereString.Length; i++)
        {
            numereIntregi[i] = Convert.ToInt32(numereString[i]);
        }

        // Calculul mediei aritmetice
        double sumaAritmetica = 0;
        foreach (int numar in numereIntregi)
        {
            sumaAritmetica += numar;
        }
        double mediaAritmetica = sumaAritmetica / numereIntregi.Length;
        Console.WriteLine($"Media aritmetica este: {mediaAritmetica}");

        // Calculul mediei geometrice
        double produsGeometric = 1;
        foreach (int numar in numereIntregi)
        {
            produsGeometric *= numar;
        }
        double mediaGeometrica = Math.Pow(produsGeometric, 1.0 / numereIntregi.Length);
        Console.WriteLine($"Media geometrica este: {mediaGeometrica}");
    }
}
