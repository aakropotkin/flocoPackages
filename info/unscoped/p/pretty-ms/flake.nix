{

  inputs.packument.url   = "https://registry.npmjs.org/pretty-ms?rev=63-3858469ebb07db89262187b3acff40a6";
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
    ident = "pretty-ms";
    ldir  = "info/unscoped/p/pretty-ms";
    inherit packument fetchInfo;
  } // latest';

}
