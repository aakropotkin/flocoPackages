{

  inputs.packument.url   = "https://registry.npmjs.org/esquery?rev=25-4628536678ee0a73e40d61d6b3315253";
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
    ident = "esquery";
    ldir  = "info/unscoped/e/esquery";
    inherit packument fetchInfo;
  } // latest';

}
