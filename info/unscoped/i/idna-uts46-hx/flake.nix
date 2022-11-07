{

  inputs.packument.url   = "https://registry.npmjs.org/idna-uts46-hx?rev=34-8bb6ff57973f98eac1e50c3a23fc9fb9";
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
    ident = "idna-uts46-hx";
    ldir  = "info/unscoped/i/idna-uts46-hx";
    inherit packument fetchInfo;
  } // latest';

}
