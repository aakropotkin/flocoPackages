{

  inputs.packument.url   = "https://registry.npmjs.org/oracledb?rev=113-07db92eaa73609220c4a091e6773c023";
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
    ident = "oracledb";
    ldir  = "info/unscoped/o/oracledb";
    inherit packument fetchInfo;
  } // latest';

}
