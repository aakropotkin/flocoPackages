{

  inputs.packument.url   = "https://registry.npmjs.org/assert?rev=129-c8085031d4cd43bffea7d34afa5833d8";
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
    ident = "assert";
    ldir  = "info/unscoped/a/assert";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
