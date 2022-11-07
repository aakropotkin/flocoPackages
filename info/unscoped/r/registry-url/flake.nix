{

  inputs.packument.url   = "https://registry.npmjs.org/registry-url?rev=32-bac160cf080b902927bd6de815a493ff";
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
    ident = "registry-url";
    ldir  = "info/unscoped/r/registry-url";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
