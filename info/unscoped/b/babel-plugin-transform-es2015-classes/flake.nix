{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-transform-es2015-classes?rev=131-a2e5b3eaf2da434e981ab54f26fc6e70";
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
    ident = "babel-plugin-transform-es2015-classes";
    ldir  = "info/unscoped/b/babel-plugin-transform-es2015-classes";
    inherit packument fetchInfo;
  } // latest';

}
