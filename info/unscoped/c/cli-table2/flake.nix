{

  inputs.packument.url   = "https://registry.npmjs.org/cli-table2?rev=45-e96220f073f958748ce8efbcd2901ab6";
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
    ident = "cli-table2";
    ldir  = "info/unscoped/c/cli-table2";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
