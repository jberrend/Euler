using System;
using System.Collections.Generic;

namespace Euler
{
    class Problem29 : Solution
    {
        public override double Solve()
        {
            var nums = new HashSet<double>();
            for (int a = 2; a <= 100; a++)
            {
                for (int b = 2; b <= 100; b++)
                {
                    nums.Add(Math.Pow(a, b));
                }

            }

            return nums.Count;
        }
    }
}