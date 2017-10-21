using System;
using System.Diagnostics;

namespace Euler
{
    abstract class Solution
    {
        public static void Run(Solution solution)
        {
            // time the duration of solutions calculation
            var stopwatch = new Stopwatch();
            stopwatch.Start();

            var answer = solution.Solve();

            stopwatch.Stop();
            Console.WriteLine("Answer: {0}", answer);
            Console.WriteLine("Time taken: {1}s : {0}ms", stopwatch.Elapsed.Milliseconds, stopwatch.Elapsed.Seconds);
        }

        // needs to be implemented by solutions classes
        public abstract double Solve();

        public static void Main(string[] args)
        {
            Run(new Problem29());
            Console.ReadKey();

        }

    }
}