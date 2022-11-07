{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-import?rev=69-607f30fb74e111577ef0f3f1b3e9b053";
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
    ident = "babel-plugin-import";
    ldir  = "info/unscoped/b/babel-plugin-import";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
