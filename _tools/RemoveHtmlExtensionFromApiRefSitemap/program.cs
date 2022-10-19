using System;
using System.IO;
using System.Xml;

namespace RemoveHtmlExtensionFromApiRefSitemap
{
    class Program
    {
        static void Main(string[] args)
        {
            if(args.Length < 2)
            {
                throw new ArgumentNullException("You must provide a path to the drop folder of the API reference so we can alter the sitemap.xml file in it.");
            }
            string pathToApiRefSitemap = Path.Combine(args[0], "sitemap.xml");
            if (!File.Exists(pathToApiRefSitemap))
            {
                throw new FileNotFoundException("API Ref sitemap file not found in the target folder");
            }
            string sitemapText = File.ReadAllText(pathToApiRefSitemap);
            sitemapText = sitemapText.Replace(".html</loc>", "</loc>");
            File.WriteAllText(pathToApiRefSitemap, sitemapText);
        }
    }
}
