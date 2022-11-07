{

  inputs.packument.url   = "https://registry.npmjs.org/agentkeepalive?rev=88-11adbd4b0b38b4bf627cc1b4a625d908";
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
    ident = "agentkeepalive";
    ldir  = "info/unscoped/a/agentkeepalive";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
