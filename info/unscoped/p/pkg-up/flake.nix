{

  inputs.packument.url   = "https://registry.npmjs.org/pkg-up?rev=17-4eb17942c7f97bc1b25d8310dfdaa8d6";
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
    ident = "pkg-up";
    ldir  = "info/unscoped/p/pkg-up";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
