{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-initial?rev=23-67fe806840717c1a712408eea0917206";
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
    scope = null;
    ident = "postcss-initial";
    ldir  = "info/unscoped/p/postcss-initial";
    inherit packument fetchInfo;
  } // latest';

}
