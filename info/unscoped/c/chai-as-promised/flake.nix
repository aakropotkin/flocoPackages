{

  inputs.packument.url   = "https://registry.npmjs.org/chai-as-promised?rev=125-62a40e9d3ef67e57abbdd255d7f2dfea";
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
    ident = "chai-as-promised";
    ldir  = "info/unscoped/c/chai-as-promised";
    inherit packument fetchInfo;
  } // latest';

}
