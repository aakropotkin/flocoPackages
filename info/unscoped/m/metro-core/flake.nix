{

  inputs.packument.url   = "https://registry.npmjs.org/metro-core?rev=125-99111c39126841bc4b2f0b86e0ae0b00";
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
    ident = "metro-core";
    ldir  = "info/unscoped/m/metro-core";
    inherit packument fetchInfo;
  } // latest';

}
