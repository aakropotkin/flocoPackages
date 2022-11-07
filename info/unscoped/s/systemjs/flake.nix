{

  inputs.packument.url   = "https://registry.npmjs.org/systemjs?rev=326-d4d06c41c0c0bf18bf219b62a3eb283f";
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
    ident = "systemjs";
    ldir  = "info/unscoped/s/systemjs";
    inherit packument fetchInfo;
  } // latest';

}
