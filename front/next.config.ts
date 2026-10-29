import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: "export",
  trailingSlash: true,

  cacheComponents: false,
  partialPrefetching: false,
};

export default nextConfig;
