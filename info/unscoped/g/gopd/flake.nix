{

  inputs.packument.url   = "https://registry.npmjs.org/gopd?rev=3-a74422c2ea3c59afc83b4e04bc4f96c1";
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
    ident = "gopd";
    ldir  = "info/unscoped/g/gopd";
    inherit packument fetchInfo;
  } // latest';

}
