using System;
using System.Collections.Generic;

namespace day1
{
    class Program
    {
        static void Main(string[] args)
        {
            List<int> depths = new List<int>();
            int deeper = 0;
            int slidingwindow = 0;

            foreach (string depth in System.IO.File.ReadLines(@"day1part1.txt"))
            {
                depths.Add(Int32.Parse(depth));
            }
            
            for (int index = 0; index < depths.Count-1; index++)
            {
                if (depths[index+1] > depths[index])
                { 
                    //Console.WriteLine("Straigh Increases");
                    deeper++;
                }
                //Console.WriteLine("{0} {1}", depths[index], depths[index+1]);
            }
            Console.WriteLine($"Total increases in day1 part1: {deeper}");

            for (int index=0; index < depths.Count-3; index++)
            {
                int sum1 = depths[index] + depths[index+1] + depths[index+2];
                int sum2 = depths[index+1] + depths[index+2] + depths[index+3];
                if (sum2 > sum1) {
                    Console.WriteLine($"Sliding Window:  {sum1} {sum2}");
                    slidingwindow++;
                }
            }

            Console.WriteLine($"Total sliding window increase day 1 part2: {slidingwindow}");
        }
    }
}
