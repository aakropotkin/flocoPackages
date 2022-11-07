{

  inputs.packument.url   = "https://registry.npmjs.org/@svgr/babel-preset?rev=28-c13a7c453d0085918ee77f6d7eea0ecc";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = "@svgr";
    ident = "@svgr/babel-preset";
    ldir  = "info/svgr/babel-preset";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
