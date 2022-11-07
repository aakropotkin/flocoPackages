{

  inputs.packument.url   = "https://registry.npmjs.org/ansi-colors?rev=37-dc8d44c4e644f9996afdc9ace28ed5ec";
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
    ident = "ansi-colors";
    ldir  = "info/unscoped/a/ansi-colors";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
