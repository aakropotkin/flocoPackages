{

  inputs.packument.url   = "https://registry.npmjs.org/nconf?rev=348-c781c7204532b8cda62fe157673c0230";
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
    ident = "nconf";
    ldir  = "info/unscoped/n/nconf";
    inherit packument fetchInfo;
  } // latest';

}
