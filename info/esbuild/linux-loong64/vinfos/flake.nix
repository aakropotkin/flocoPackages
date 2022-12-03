{
  inputs."v0_0_1".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.0.1";
  inputs."v0_14_52".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.14.52";
  inputs."v0_14_53".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.14.53";
  inputs."v0_14_54".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.14.54";
  inputs."v0_15_0".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.0";
  inputs."v0_15_1".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.1";
  inputs."v0_15_10".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.10";
  inputs."v0_15_11".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.11";
  inputs."v0_15_12".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.12";
  inputs."v0_15_13".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.13";
  inputs."v0_15_14".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.14";
  inputs."v0_15_15".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.15";
  inputs."v0_15_16".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.16";
  inputs."v0_15_2".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.2";
  inputs."v0_15_3".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.3";
  inputs."v0_15_4".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.4";
  inputs."v0_15_5".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.5";
  inputs."v0_15_6".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.6";
  inputs."v0_15_7".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.7";
  inputs."v0_15_8".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.8";
  inputs."v0_15_9".url = "https://registry.npmjs.org/@esbuild/linux-loong64/0.15.9";

  inputs."v0_0_1".flake = false;
  inputs."v0_14_52".flake = false;
  inputs."v0_14_53".flake = false;
  inputs."v0_14_54".flake = false;
  inputs."v0_15_0".flake = false;
  inputs."v0_15_1".flake = false;
  inputs."v0_15_10".flake = false;
  inputs."v0_15_11".flake = false;
  inputs."v0_15_12".flake = false;
  inputs."v0_15_13".flake = false;
  inputs."v0_15_14".flake = false;
  inputs."v0_15_15".flake = false;
  inputs."v0_15_16".flake = false;
  inputs."v0_15_2".flake = false;
  inputs."v0_15_3".flake = false;
  inputs."v0_15_4".flake = false;
  inputs."v0_15_5".flake = false;
  inputs."v0_15_6".flake = false;
  inputs."v0_15_7".flake = false;
  inputs."v0_15_8".flake = false;
  inputs."v0_15_9".flake = false;

  outputs = { v0_0_1, v0_14_52, v0_14_53, v0_14_54, v0_15_0, v0_15_1, v0_15_10
  , v0_15_11, v0_15_12, v0_15_13, v0_15_14, v0_15_15, v0_15_16, v0_15_2, v0_15_3
  , v0_15_4, v0_15_5, v0_15_6, v0_15_7, v0_15_8, v0_15_9
  , ... } @ inputs: let
    isVi = s: ( builtins.match "v[0-9_]+" s ) != null;
    vifs = builtins.filter isVi ( builtins.attrNames inputs );
  in {
    vinfos = let
      proc = acc: v: acc // {
        ${v} = builtins.fromJSON ( builtins.readFile inputs.${v} );
      };
    in builtins.foldl' proc {} vifs;
  };
}
