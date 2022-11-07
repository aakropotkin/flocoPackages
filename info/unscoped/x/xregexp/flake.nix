{

  inputs.packument.url   = "https://registry.npmjs.org/xregexp?rev=87-da6ffc8b17241578731d99dc26e66c45";
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
    ident = "xregexp";
    ldir  = "info/unscoped/x/xregexp";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
