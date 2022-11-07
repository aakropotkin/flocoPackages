{

  inputs.packument.url   = "https://registry.npmjs.org/underscore?rev=854-ab021bc364c69176db26a65e2ab40313";
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
    ident = "underscore";
    ldir  = "info/unscoped/u/underscore";
    inherit packument fetchInfo;
  } // latest';

}
