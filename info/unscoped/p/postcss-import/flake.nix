{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-import?rev=100-81f65673343238571a56e49fbb904298";
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
    ident = "postcss-import";
    ldir  = "info/unscoped/p/postcss-import";
    inherit packument fetchInfo;
  } // latest';

}
