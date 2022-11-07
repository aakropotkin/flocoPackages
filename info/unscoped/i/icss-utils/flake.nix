{

  inputs.packument.url   = "https://registry.npmjs.org/icss-utils?rev=13-77028064a761816a74b141c0786f56c8";
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
    ident = "icss-utils";
    ldir  = "info/unscoped/i/icss-utils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
