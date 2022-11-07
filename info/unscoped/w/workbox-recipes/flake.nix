{

  inputs.packument.url   = "https://registry.npmjs.org/workbox-recipes?rev=26-d7efa88c171338b7b60fb4356c005837";
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
    ident = "workbox-recipes";
    ldir  = "info/unscoped/w/workbox-recipes";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
