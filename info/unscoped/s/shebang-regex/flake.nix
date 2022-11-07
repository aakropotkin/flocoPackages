{

  inputs.packument.url   = "https://registry.npmjs.org/shebang-regex?rev=9-8064cefb0125d41107045f66a9548ac9";
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
    ident = "shebang-regex";
    ldir  = "info/unscoped/s/shebang-regex";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
