{

  inputs.packument.url   = "https://registry.npmjs.org/select?rev=29-33c988283c41d14d8f1bd31ef666586d";
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
    ident = "select";
    ldir  = "info/unscoped/s/select";
    inherit packument fetchInfo;
  } // latest';

}
