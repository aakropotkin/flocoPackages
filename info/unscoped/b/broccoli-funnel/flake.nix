{

  inputs.packument.url   = "https://registry.npmjs.org/broccoli-funnel?rev=67-7171d5bce022ca0603b78e1e5fc9f55b";
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
    ident = "broccoli-funnel";
    ldir  = "info/unscoped/b/broccoli-funnel";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
