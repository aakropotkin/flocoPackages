{

  inputs.packument.url   = "https://registry.npmjs.org/section-matter?rev=2-0c5b8d6e71d5ff18b28d2e01b968b176";
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
    ident = "section-matter";
    ldir  = "info/unscoped/s/section-matter";
    inherit packument fetchInfo;
  } // latest';

}
