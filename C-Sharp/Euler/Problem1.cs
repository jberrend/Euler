using System;

namespace Euler
{
    internal class Problem1 : Solution
    {
        public override Double Solve()
        {
            int count = 0;
            for (int i = 0; i < 1000; i++)
            {
                if (i % 3 == 0 || i % 5 == 0)
                {
                    count += i;
                }
            }
            return count;
        }
    }
}