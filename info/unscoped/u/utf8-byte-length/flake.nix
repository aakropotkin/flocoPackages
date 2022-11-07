{

  inputs.packument.url   = "https://registry.npmjs.org/utf8-byte-length?rev=8-26199c39f25dedc5fb3024577c28ced7";
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
    ident = "utf8-byte-length";
    ldir  = "info/unscoped/u/utf8-byte-length";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
