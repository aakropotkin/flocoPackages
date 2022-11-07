{

  inputs.packument.url   = "https://registry.npmjs.org/domutils?rev=65-4a36b2e2dc77b952daa2140b3cd53c14";
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
    ident = "domutils";
    ldir  = "info/unscoped/d/domutils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
