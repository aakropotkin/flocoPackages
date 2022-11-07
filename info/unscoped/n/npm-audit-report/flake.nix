{

  inputs.packument.url   = "https://registry.npmjs.org/npm-audit-report?rev=47-f7bfac84ef8b625c22d6d147f7633324";
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
    ident = "npm-audit-report";
    ldir  = "info/unscoped/n/npm-audit-report";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
