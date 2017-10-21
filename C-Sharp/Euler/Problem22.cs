using System;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text.RegularExpressions;

namespace Euler
{
    class Problem22 : Solution
    {
        public override double Solve()
        {
            string fileNames = File.ReadAllText("/home/jon/code/csharp/Euler/Euler/names.txt");

            // split into names
            string[] names = fileNames.Split(',');

            // remove the quotes around the string
            Regex reg = new Regex("[^a-zA-Z]");
            for (int i = 0; i < names.Length; i++)
            {
                names[i] = reg.Replace(names[i], String.Empty);

            }
            Console.WriteLine(names[1]);

            return -1;

        }
    }
}
