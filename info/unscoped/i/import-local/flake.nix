{

  inputs.packument.url   = "https://registry.npmjs.org/import-local?rev=12-6669325914bf3d3fae9f7c7d299fc183";
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
    ident = "import-local";
    ldir  = "info/unscoped/i/import-local";
    inherit packument fetchInfo;
  } // latest';

}
