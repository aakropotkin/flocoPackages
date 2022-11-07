{

  inputs.packument.url   = "https://registry.npmjs.org/atob?rev=25-28d68c2ed20ea4b5a717fa170e8b9264";
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
    ident = "atob";
    ldir  = "info/unscoped/a/atob";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
