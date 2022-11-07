{

  inputs.packument.url   = "https://registry.npmjs.org/normalize-url?rev=73-83b3662645187cc8e193cabfd6c7f11a";
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
    ident = "normalize-url";
    ldir  = "info/unscoped/n/normalize-url";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
