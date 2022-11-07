{

  inputs.packument.url   = "https://registry.npmjs.org/jasmine-core?rev=106-bef80aff8adad8bb9d6b4dd3bff9d42a";
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
    ident = "jasmine-core";
    ldir  = "info/unscoped/j/jasmine-core";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
