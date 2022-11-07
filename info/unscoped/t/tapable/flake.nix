{

  inputs.packument.url   = "https://registry.npmjs.org/tapable?rev=75-44c1e525187392f095b42637a118a1ff";
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
    ident = "tapable";
    ldir  = "info/unscoped/t/tapable";
    inherit packument fetchInfo;
  } // latest';

}
